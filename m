From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: smtp
Date: Fri, 14 May 2004 14:40:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405141440.16991.gdh@acentral.co.uk>
References: <BAY15-F38OoiE7FIVSi0005b8c6@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F38OoiE7FIVSi0005b8c6@hotmail.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Friday 14 May 2004 14:19, azeem ahmad wrote:
> hi
> please tell me how can i save the output of tcpdump to a file
>
> i tried -F anf -w but it doesnt seem to work

-w is the one to use, but you do need to tell it a filename. However, what I 
meant was simply copy + paste the output you see on the console since that 
will be a lot easier for us to glance at.. I mean the stuff like this:

tel# tcpdump -i eth1 -n port 25
tcpdump: listening on eth1
14:39:37.592117 10.0.0.52.3564 > 194.200.209.13.25: S 1292097321:1292097321(0) 
win 64240 <mss 1460,nop,nop,sackOK> (DF)
14:39:37.592174 10.0.0.254.3564 > 10.0.0.253.25: S 1292097321:1292097321(0) 
win 64240 <mss 1460,nop,nop,sackOK> (DF)
14:39:37.592353 10.0.0.253.25 > 10.0.0.254.3564: S 958030498:958030498(0) ack 
1292097322 win 5840 <mss 1460,nop,nop,sackOK> (DF)
14:39:37.592381 194.200.209.13.25 > 10.0.0.52.3564: S 958030498:958030498(0) 
ack 1292097322 win 5840 <mss 1460,nop,nop,sackOK> (DF)
14:39:37.592587 10.0.0.52.3564 > 194.200.209.13.25: . ack 1 win 64240 (DF)
14:39:37.592603 10.0.0.254.3564 > 10.0.0.253.25: . ack 1 win 64240 (DF)

Cheers,
Gavin.

