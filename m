From: "azeem ahmad" <azeem484@hotmail.com>
Subject: Re: smtp
Date: Fri, 14 May 2004 18:54:59 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY15-F259LvuKebm4M0005eee3@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hi
here is the out put even after blocking all smtp
---------------------------------------------------------------------------------------------------------------------------------
21:17:31.259275 192.168.0.101.4730 > 207.24.89.66.smtp: S 
556950735:556950735(0) win 64240 <mss 1460,nop,nop,sackOK> (DF)
21:17:32.064278 192.168.0.101.4732 > 216.240.135.98.smtp: S 
557195445:557195445(0) win 64240 <mss 1460,nop,nop,sackOK> (DF)
21:17:33.021182 192.168.0.101.4735 > 202.163.96.6.smtp: S 
557501406:557501406(0) win 64240 <mss 1460,nop,nop,sackOK> (DF)
21:17:33.519967 192.168.0.101.4727 > 216.127.83.228.smtp: S 
556716191:556716191(0) win 64240 <mss 1460,nop,nop,sackOK> (DF)
21:17:34.224181 192.168.0.101.4730 > 207.24.89.66.smtp: S 
556950735:556950735(0) win 64240 <mss 1460,nop,nop,sackOK> (DF)
21:17:35.028993 192.168.0.101.4732 > 216.240.135.98.smtp: S 
557195445:557195445(0) win 64240 <mss 1460,nop,nop,sackOK> (DF)
----------------------------------------------------------------------------------------------------------------------------------
>From: Gavin Hamill <gdh@acentral.co.uk>
>To: netfilter@lists.netfilter.org
>Subject: Re: smtp
>Date: Fri, 14 May 2004 16:53:13 +0100
>
>On Friday 14 May 2004 16:41, azeem ahmad wrote:
> > hi
> > sorry for disturbing you a lot
> > but i dont know how can i capture the screen. should i write it down
>
>That's OK there are a couple of easy alternatives. Either 'ssh' into the
>machine (google for 'putty' - a good SSH client for windows) and copy and
>paste the output.. or redirect the output from tcpdump to a file, the same
>way you can with any UNIX command...
>
>$ tcpdump -n -i eth1 port 25 >dump.txt
>
>Then you can just insert this text file into the body of your email.
>
>Cheers,
>Gavin.
>

_________________________________________________________________
The new MSN 8: smart spam protection and 2 months FREE*  
http://join.msn.com/?page=features/junkmail


