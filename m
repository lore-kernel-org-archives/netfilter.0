From: Jason Opperisano <opie@817west.com>
Subject: Re: What about these packets?
Date: Fri, 28 Jan 2005 21:43:12 -0500
Message-ID: <1106966592.4592.5.camel@hubcap.ljm.dom>
References: <1106965785.21043.4.camel@croaker>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1106965785.21043.4.camel@croaker>
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

On Fri, 2005-01-28 at 21:29, Mohammad Khan wrote:
> two rules in my INPUT chains are:
> -A INPUT -s 63.110.21.51 -m state --state NEW -j LOG --log-prefix
> "PLAYNC_NEW " --log-level debug
> -A INPUT -s 63.110.21.51 -m state --state NEW -j DROP
> 
> My router is keeping the following logs
> 
> Jan 28 18:32:46 stingray kernel: PLAYNC_NEW IN=eth0 OUT=
> MAC=00:c0:26:63:47:f5:00:90:1a:40:a2:9f:08:00 SRC=63.110.21.51
> DST=x.x.x.x LEN=32 TOS=0x00 PREC=0x20 TTL=1 ID=775 PROTO=UDP SPT=14339
> DPT=33438 LEN=12
> Jan 28 18:32:46 stingray kernel: PLAYNC_NEW IN=eth0 OUT=
> MAC=00:c0:26:63:47:f5:00:90:1a:40:a2:9f:08:00 SRC=63.110.21.51
> DST=x.x.x.x LEN=32 TOS=0x00 PREC=0x20 TTL=1 ID=1031 PROTO=UDP SPT=14339
> DPT=33440 LEN=12
> Jan 28 18:32:51 stingray kernel: PLAYNC_NEW IN=eth0 OUT=
> MAC=00:c0:26:63:47:f5:00:90:1a:40:a2:9f:08:00 SRC=63.110.21.51
> DST=x.x.x.x LEN=32 TOS=0x00 PREC=0x20 TTL=2 ID=776 PROTO=UDP SPT=14339
> DPT=33438 LEN=12
> Jan 28 18:32:51 stingray kernel: PLAYNC_NEW IN=eth0 OUT=
> MAC=00:c0:26:63:47:f5:00:90:1a:40:a2:9f:08:00 SRC=63.110.21.51
> DST=x.x.x.x LEN=32 TOS=0x00 PREC=0x20 TTL=2 ID=1032 PROTO=UDP SPT=14339
> DPT=33440 LEN=12
> Jan 28 18:32:56 stingray kernel: PLAYNC_NEW IN=eth0 OUT=
> MAC=00:c0:26:63:47:f5:00:90:1a:40:a2:9f:08:00 SRC=63.110.21.51
> DST=x.x.x.x LEN=32 TOS=0x00 PREC=0x20 TTL=2 ID=776 PROTO=UDP SPT=14339
> DPT=33438 LEN=12
> Jan 28 18:32:56 stingray kernel: PLAYNC_NEW IN=eth0 OUT=
> MAC=00:c0:26:63:47:f5:00:90:1a:40:a2:9f:08:00 SRC=63.110.21.51
> DST=x.x.x.x LEN=32 TOS=0x00 PREC=0x20 TTL=2 ID=1032 PROTO=UDP SPT=14339
> DPT=33440 LEN=12
> Jan 28 18:33:01 stingray kernel: PLAYNC_NEW IN=eth0 OUT=
> MAC=00:c0:26:63:47:f5:00:90:1a:40:a2:9f:08:00 SRC=63.110.21.51
> DST=x.x.x.x LEN=32 TOS=0x00 PREC=0x20 TTL=3 ID=777 PROTO=UDP SPT=14339
> DPT=33438 LEN=12
> 
> 
> I have replace my original ip with x.x.x.x
> What can I say about these packets?
> Please let me learn more details about this packet.

judging from the destination UDP ports and the TTL--i would say that
they are traceroute packets.

-j

--
"What's the point of going out, we're just going to end up back
 here anyway?"
	--The Simpsons


