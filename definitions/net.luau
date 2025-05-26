--- ## `@lute/net` - networking modules for writing HTTP servers and clients
local net = {}

--- All possible method types for HTTP requests
---
--- See https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Methods for more details.
export type HttpRequestMethod = "GET" | "POST" | "PUT" | "DELETE" | "HEAD" | "CONNECT" | "OPTIONS" | "TRACE" | "PATCH"
export type HttpHeaderMap = { [string]: string }

--- A set of options to be passed to [net.request]
export type RequestOptions = {
	--- The [HttpRequestMethod] to be used while making the request, defaults to `GET`
	method: HttpRequestMethod?,
	--- An optional body for request methods that take it
	body: string?,
	--- An optional set of of headers in the form of key-value pairs to attach to the request
	headers: HttpHeaderMap?,
}

--- The result value of [net.request], describing the HTTP response returned by the server
export type Response = {
	--- The response body, equal to an empty string when no body was returned
	body: string,
	--- The response headers, equal to an empty table when no headers were set
	headers: HttpHeaderMap,
	--- The status code, see https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Status
	status: number,
	--- Whether the response was a successful one, i.e., status code was 200-299
	ok: boolean,
}

export type RequestHandler = (request: ServeRequest) -> ()

--- Represents an HTTP request made to a running [net.serve] server
export type ServeRequest = {
	--- The path the request was made to
	path: string,
	---  The method of the request
	method: HttpRequestMethod,
	--- The query parameters of the request, defaults to an empty table
	query: { [string]: string },
	--- The headers of the request, defaults to an empty table
	headers: { [string]: string },
	--- The request body, defaults to an empty string
	body: string,
}

--- TLS configuration options for [net.serve]
export type TlsOptions = {
	--- Path to the certfile containing the public key the clients should use for validating requests
	cert_file_name: string,
	--- Path to the DER or PEM file containing the private key the server should use for signing requests
	key_file_name: string,
	--- Passphrase used for the key file provided in `key_file_name`
	passphrase: string,
	--- Path to the trusted root CA certificate
	ca_file_name: string,
}

--- A set of options to be passed to [net.serve]
export type ServeOptions = {
	--- The hostname of the network interface to listen on, defaults to `0.0.0.0`
	hostname: string?,
	--- The port to listen on, defaults to `3000`
	port: number?,
	--- Whether to reuse a port lute is already listening on, defaults to false
	reuseport: boolean?,
	--- Options relating to the TLS configuration of the server
	tls: TlsOptions?,
	--- Function to handle incoming requests
	handler: RequestHandler,
}

--- A handle to a running [net.serve] task, returned immediately after the function is called
export type ServeHandle = {
	--- The hostname the server is listening on
	hostname: string,
	--- The port the server is listening on
	port: number,
	--- A function to close the server, returning a boolean of whether it was successful
	close: () -> boolean,
}

--- Starts an HTTP server listening for requests and returns a handle to it
function net.serve(optionsorhandler: ServeOptions | RequestHandler): ServeHandle
	error("not implemented")
end

--- Makes an HTTP request to `url` as per the `options` defined and returns the response
function net.request(url: string, options: RequestOptions): Response
	error("not implemented")
end

return net