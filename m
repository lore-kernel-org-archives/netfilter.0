From: Thomas Jacob <jacob@internet24.de>
Subject: Re: OpenVPN throttling problem
Date: Tue, 07 Sep 2010 17:37:49 +0200
Message-ID: <1283873869.32608.259.camel@enterprise.ims-firmen.de>
References: <BAY145-ds40063ED1096C32DC63795F3710@phx.gbl>
	 <1283857776.32608.39.camel@enterprise.ims-firmen.de>
	 <BAY145-ds21DEA1A44DBD89BF0401BCF3710@phx.gbl>
	 <1283871946.32608.212.camel@enterprise.ims-firmen.de>
	 <BAY145-ds1243A907F1D466511E7978F3710@phx.gbl>
	 <1283872818.32608.230.camel@enterprise.ims-firmen.de>
	 <BAY145-ds1067276A7A7850F8D2EC0AF3710@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BAY145-ds1067276A7A7850F8D2EC0AF3710@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: J Webster <webster_jack@hotmail.com>
Cc: netfilter@vger.kernel.org

On Tue, 2010-09-07 at 11:25 -0400, J Webster wrote:
> Well, I have openVPN running as a tcp and also as a udp service on the 
> server but I am having problems with video stuttering on both connections.
> The streaming is however probably done via tcp. 

To clarify, the issue is TCP or UDP connections that
are sent thru the tunnel, not how the OpenVPN
tunnel connection itself. So unless you run UDP services
that transfer data (like NFS over UDP) via the tunnel,
you should have no significant problems with UDP.

BTW, using TCP for tunnelling is considered a
bad idea by some:

http://sites.inka.de/bigred/devel/tcp-tcp.html

> For example, the client 
> would access msn video or youtube from their browser, connection then goes 
> through the VPN, then to the internet, then back to the VPN, then back to 
> the client.

Well fooling geolocation this way only works until the companies in
question start blocking data centers as well as public proxy
services (=>
http://techcrunch.com/2009/05/06/control-freaks-hulu-now-blocks-anonymous-proxies-too/
) but that's not my problem :=)

> I can try the mss clamp for the tcp connection but it doesn;t solve the same 
> bandwidth issue on the udp VPN connection I suppose.


