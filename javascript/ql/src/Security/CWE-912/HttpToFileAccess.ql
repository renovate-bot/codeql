/**
 * @name User-controlled data written to file
 * @description Writing user-controlled data directly to the file system allows arbitrary file upload and might indicate a backdoor.
 * @kind path-problem
 * @problem.severity warning
 * @id js/http-to-file-access
 * @tags security
 *       external/cwe/cwe-912
 */

import javascript
import semmle.javascript.security.dataflow.HttpToFileAccess::HttpToFileAccess
import DataFlow::PathGraph

from Configuration cfg, DataFlow::PathNode source, DataFlow::PathNode sink
where cfg.hasPathFlow(source, sink)
select sink.getNode(), source, sink, "$@ flows to file system", source, "Untrusted data"
