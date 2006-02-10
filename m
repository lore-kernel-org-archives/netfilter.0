From: KOVACS Krisztian <hidden@sch.bme.hu>
Subject: Re: SNAT round-robin broken?
Date: Fri, 10 Feb 2006 22:12:21 +0100
Message-ID: <200602102212.22491@krak>
References: <3d00e6dc0602100722l482ae14naa0964f58fb83753@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3d00e6dc0602100722l482ae14naa0964f58fb83753@mail.gmail.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: Khoa Nguyen <khoa.coffee@gmail.com>


  Hi,

On Friday 10 February 2006 16:22, Khoa Nguyen wrote:
> I have the following on a box acting as a router between a client and
> a web server:
>
> iptables -t nat -A POSTROUTING --source 10.1.1.1 --destination
> 10.2.1.1 --protocol tcp --dport 80 -j SNAT --to-source
> 192.168.20.1-192.168.20.100
>
> I open several http connections from the client to the server, the
> gateway for some reason SNAT to a single random address only and
> doesn't do round-robin for every socket from the client. Is something
> broken? How I force it to perform round-robin SNAT'ing?
>
> My kernel: 2.6.12-1.1381_FC3
> iptables version: 1.3.4

  Have you tried it with more than one internal IP address connecting to 
multiple destination addresses? Netfilter chooses the translated source 
IP based on the source and destination address of the original 
connection.

-- 
 KOVACS Krisztian

