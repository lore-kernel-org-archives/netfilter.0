From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: VPN software behind iptables
Date: 27 Dec 2002 18:10:45 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1040992851.894.5.camel@india>
References: <3E0C426B.3010306@bol.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E0C426B.3010306@bol.com.br>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Julio Cesar Ody <julioody@bol.com.br>
Cc: netfilter@lists.netfilter.org

It could be< just mentioning the trouble shooting :

1) Log all the packets coming from that ip
2) try to connect from the client
3) see whether you receive all the packets you receive?
4) If yes, run sniffer to see actually what happens.

-- 
Dharmendra.T
Linux Security Expert
On Fri, 2002-12-27 at 17:37, Julio Cesar Ody wrote:
> Hello. I have a software in my store who uses a VPN connection to 
> exchange data with a server outside my network. The software is able to 
> make the connection, however, once it's done, nothing else happens, and 
> I'm not able to do nothing. I'm pretty sure it's not a bug in the 
> software, because I tried to connect directly to outside using the WiFi 
> card located in my server (slackware 8.1, kernel 2.4.19, iptables 1.26) 
> and it worked just fine.
> Is there anhy issue regarding VPN routing with iptables ? Thanks.
> 
> 
> Julio Cesar Ody
> 
> 



