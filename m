From: Michael Tautschnig <michael.tautschnig@zt-consulting.com>
Subject: RE: Single IP
Date: Fri, 4 Mar 2005 12:17:09 +0100 (CET)
Message-ID: <Pine.LNX.4.62.0503041209000.7410@L01.THNET>
References: <20686C579479DC438276A726FE80CDAA0294CBD3@INEXCH1>
Mime-Version: 1.0
In-Reply-To: <20686C579479DC438276A726FE80CDAA0294CBD3@INEXCH1>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Pmishra@in.safenet-inc.com
Cc: netfilter@lists.netfilter.org

>
> - What is the client using to access your services? A web-browser?
> I Open the the portal page and click on the some link then my own service
> start and listen the server.
> - What "services" are you providing? Websites?
> I have two application name is VPX and FNC.
> - You can't have more than one application listening on port 80, so how are
> you dealing with that issue?
> My requirement is OPEN ONE tunnel( between server and client) and all the
> data will send via this tunnel. and In server side I check the packet and
> forward To appropriate server as per FLAG.

So I assume, these packets are not http-requests anymore. If you're able 
to control the packets sent by the client, you could, e.g., abuse the 
DSCP-field of the IP header. By setting it to some specific value, you 
might be able to match it at your site and then, using the 
REDIRECT-target, you could send the packets where you want.

If you are unable to control the packets sent by the client, you should 
finally tell us what this is all about, i.e., you need to explain the 
whole handshake.

Regards,
Michael

