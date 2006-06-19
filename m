From: "Angel Tsankov" <fn42551@fmi.uni-sofia.bg>
Subject: configuring iptables for masquerading
Date: Mon, 19 Jun 2006 15:23:53 +0300
Message-ID: <002b01c6939b$3e0f4580$cf34000a@sven>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0028_01C693B4.5F674E80"
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: "ML: netfilter" <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0028_01C693B4.5F674E80
Content-Type: text/plain; format=flowed; charset="Windows-1252";
	reply-type=original
Content-Transfer-Encoding: 7bit

I've configured iptables for masquerading and when some of the masqueraded hosts performs a trace route I get this:

tracert www.abv.bg

Tracing route to www.abv.bg [194.153.145.105]
over a maximum of 30 hops:

  1    17 ms     5 ms     6 ms  194.153.145.105

Trace complete.

This route is obviously too short. I have attached the /etc/rc.d/rc.iptables file. Could someone tell me what I have misconfigured?
------=_NextPart_000_0028_01C693B4.5F674E80
Content-Type: application/octet-stream;
	name="rc.iptables.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="rc.iptables.tar.gz"

H4sICMZjlUQCA3JjLmlwdGFibGVzLnRhcgDtV21v2zYQ9uf8ihvyIS0Qv7VJO+zDADd2tgyt49kO
su2LQVNni61EaiQVV/9+d5T8EidNmqwbhkGHAFJE8uHxuYd3ZytbKvNinqBr/FPWIXvb6ZTPNyf8
7NJf+J/szWnnVaPbOTk5ffWmc9p93eh0u29PThvQafwLljsvLEBDRKnSD8wbGo2N/58dfteeK912
8cHBIQw0CwHm1ohICucBZWxgZI1H6ZXRrYPwoQs/QjuzRrZd4doafVtlNydtJdNsxhNmaqmNxdkG
xzF4X7mAPjG5lQhjk3uMYCTkJ/SuQu7cjyyNXrRFkrSFlJj5mQsQM8sQO35Pz0Yw+X0IZ8Z8UvjV
fnuZzVyhZVh1y9WLsw8jGGOkLOFAL2wutMSneWsrgBLa6CMPDnW0Bf6Azoklfi0JvHgP1JoMJpkx
iy2jIA0JeglKg9EgNL14tAtB1K9itAgWXWa0oxMfwsrkScRf8sTzCh/zeJYUsDQMQkSDgEgtFrRS
+y3Ww8xuXLbZbKESWsPevjdLyConV8rHoNLMOKeYcRFF5IXbcPEYcGKWs1RYr4QOTLxDuEE7Nw75
1FGhRaokXIy2wAAvtPGgESMii85KAqXJC6A84MPcl+XWr76g8mzGsAS3q5TB5yxRUnnSnqZIsuhg
aLxaKClKBR7CC28MpEIXEIRrHQgKA81NEgg3Rmj/8kEJsFJRat54gh4iXAgOGHtOkVjncWiO4GI4
upoCQH98Obo1cH45vu6N+3cHLq+mYUkYoA2mMRIvidJY+hk0s6bL5kn1WSQWRVTwSJawuAQpm+RD
CE5a2gCUA6SYkJ5sHrTI4lokRQuuSYp0ZvCGBlNzw2jJGltHBJFZbOJnRRyRCHNHKHRmcikCGQul
HcxxQZkGVsgiSjBlcWpclSC7lJzvvP+28/7HzruHUqS3Z3uO2ZJivPdVC8+fyMtekpgV8G13jg/T
H06IJhmz0+QzHX7Xk14VnGYGFE9oNstsBt1Oq9M6fd3qdr6nj1FmrIfT19D8CL2zs8Foej9EHj0X
ogr41o3N9GYqvIxLWfFAeA4m09679xeTnwf9RwErp54DuKGT4roSNmIO6RWWtGQliiACd5vOtaTv
p8FAlmWdL7i8XfokD/t8j92fOVrBDrbu6qIHo8vJdEyUXAx/4sUfepNfrwbjXn+wPSIV3qgUf1UI
WDiMqnDviPuxih6mdji4Pn56vL4J6L62/66o9oX+XE2FUlwW9JBhLRLR1JmEfMWl7g7nVQptNikP
U5C4u9nsWv3Dj6YvMgyYzQrzEbqfgscVGL4h3kP+Pee8+/4R09cx6ioX8t09n46qHOiArjGlbc/J
/JirACXuVC1jT1kcJFpPGZ3yeyIKzutS0FXnKmLSneQeiqmDWFCxCHUEhc9tqN98cQreknudiOZG
62IjKbjaM1bhPKZ85cw87MbZhFoECj1dSR+bfBmXjh05EgVVo4IqoPeU/GNh07IzUu6YoMiD23tR
cdOh33LA/QXdZ5OSx9xkVIcpa79DmVvlC8DPGZ2Zu68FYhIcZaIUJbCluqGYcNMVWoacIkANh+Kz
C+oVNCXEtGwrgCu1AXFjVCi7tEvFYGFyagHLtu4jJ5eyp6tUH/ouAUd0SymMDv3RD3DfvavEsJt1
ut1QUcaDXwZnPKOEbwbEDdxB6ZfjwPFhI5zny2XJGBMCC6EsB4IooR9W1JKaqglN1CcMA0FCBMN9
Z2iyojU/x+sjrbtIT6qqlhsO30oRD7RJRH1xhtG91Xd9gp3fD9Qmnm+qziO/daihLaceNGqrrbba
aqutttpqq6222mqrrbbaaqutttpqq6222v5T9he5O+woACgAAA==

------=_NextPart_000_0028_01C693B4.5F674E80--


