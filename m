From: Jason Opperisano <opie@817west.com>
Subject: Re: why am I getting this syn packet
Date: Wed, 19 Jan 2005 12:12:36 -0500
Message-ID: <20050119171236.GA12213@bender.817west.com>
References: <JKENKBGIPCFNFMNFENJPCEMICJAA.peter.marshall@caris.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <JKENKBGIPCFNFMNFENJPCEMICJAA.peter.marshall@caris.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@lists.netfilter.org>

On Wed, Jan 19, 2005 at 10:59:18AM -0400, Peter Marshall wrote:
> 
> I have a stand alone proxy server in my dmz.  It has an internal IP (that
> internal users connect to), and an external IP.
> I am seeing the following on my internal firewall logs.  I am not sure why
> the proxy would be trying to send a syn packet to the internal.
> 
> 
> Jan 19 10:56:40 radium kernel: DROP: prxy-int IN=eth1 OUT=eth0
> SRC=192.168.1.254 DST=192.168.201.109 LEN=60 TOS=0x00 PREC=0x00 TTL=63
> ID=57253 DF PROTO=TCP SPT=60145 DPT=113 WINDOW=5840 RES=0x00 SYN URGP=0

your proxy server is sending an ident request to the client.  i don't
believe that squid does ident lookups by default--so you must have
something in your squid.conf that's making it do it.

-j

--
"'Wet Cement' - is there any sweeter sign?  Maybe 'High Voltage.'"
        --The Simpsons

