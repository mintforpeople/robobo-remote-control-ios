/*******************************************************************************
 *
 *   Copyright 2019, Manufactura de Ingenios Tecnológicos S.L. 
 *   <http://www.mintforpeople.com>
 *
 *   Redistribution, modification and use of this software are permitted under
 *   terms of the Apache 2.0 License.
 *
 *   This software is distributed in the hope that it will be useful,
 *   but WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND; without even the implied
 *   warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *   Apache 2.0 License for more details.
 *
 *   You should have received a copy of the Apache 2.0 License along with    
 *   this software. If not, see <http://www.apache.org/licenses/>.
 *
 ******************************************************************************/
//
//  CommandSanitizer.swift

//
//  Created by Luis on 06/06/2019.
//


public class CommandSanitizer: NSObject {
    
    
    
    private static func matches(for regex: String, in text: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            let finalResult = results.map {
                String(text[Range($0.range, in: text)!])
            }
            return finalResult
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    static public func sanitize(_ input: String) -> String{
        let regex = try? NSRegularExpression(pattern: "(?<=\\w\\w\\w\":)\\d++")
        
        let text:NSMutableString =  NSMutableString(string: input)
        
        regex?.replaceMatches(in: text , options: .reportProgress, range: NSRange(location: 0,length: text.length), withTemplate: "\"$0\"")
        
        return text as String
        
    }
}
