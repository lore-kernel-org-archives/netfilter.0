From: netfilter <netfilter@newkirk.us>
Subject: Re: psd and active ftp mode
Date: 08 Apr 2003 22:18:19 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049854699.32113.16.camel@alpha.newkirk.us>
References: <136459744507.20030409032210@lf.lv>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <136459744507.20030409032210@lf.lv>
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
To: Peteris Krumins <newsgroups@lf.lv>
Cc: netfilter@lists.netfilter.org

On Tue, 2003-04-08 at 20:22, Peteris Krumins wrote:
> hello,
> 
>  i was just testing psd match and w/ ftp active mode.
> 
>  I created 10000 files on the ftp server and set my ftp client to
>  active mode and let it download those files while having
>  `iptables -A INPUT -p tcp -m psd -j REJECT --reject-with tcp-reset`
>  (with psd default threshold/weigh values).
>  The psd matched 3136 packets.
> 
>  Ftp server went mad issuing:
>   425: Unable to build data connection: Connection refused
> 
>  This means i cannot relay on psd and block 'possible portscans'?
>  Any suggestions?

What are you trying to accomplish?  If you want it to block all the
packets then set the threshold higher/longer and you'll catch most.  If
you want it to NOT catch them, then set it shorter.  Do you anticipate a
production situation where you will have 10000 sequential FTP
connections that you want to get through in a short time, or are you
trying to simulate a rapid succession of destport accesses?  (were they
sequential, or was the client pulling several at a time, like 4
simultaneous transfers?)

j



