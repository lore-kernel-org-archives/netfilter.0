From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ADSL Proxy
Date: Sat, 19 Jun 2004 14:15:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406191415.39254.Antony@Soft-Solutions.co.uk>
References: <HAEOIFPIBBBLGLHOMLLIOEPCCAAA.bclark@eccotours.biz>
Reply-To: "iptables" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <HAEOIFPIBBBLGLHOMLLIOEPCCAAA.bclark@eccotours.biz>
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
To: iptables <netfilter@lists.netfilter.org>

On Friday 18 June 2004 2:00 pm, Brent Clark wrote:

> Hi all
>
> Im not to sure if this is the right place to place this email, if not, then
> I apologise.
>
> Could anyone recommend a proxy server for a adsl connection. Given that I
> do not have a static IP, I was wondering if there is anything out on the the
> net that could assist me with my problem.

What do you mean by a "proxy"?

What do you want it to do?

If you mean a web proxy to allow client machines on an internal network to 
access websites on the Internet, try Squid http://www.squid-cache.org

If you mean a dynamic DNS server which will allow other people to access your 
machine/s by a fixed name even though your IP address changes, then you need 
"dynamic DNS", for which there are many services available - try Google.

If you mean a more general-purpose proxy for outbound http, ftp, smtp, ssh, 
pop3 etc then there are things which will do all of these for you, but not in 
a single open-source package.   Try Google again for some ideas.

If you mean an "IP proxy" (I just made up that term), which will allow 
internal machines on your network to access any services they like on the 
Internet, by using the single dynamic public IP address assigned by your ISP, 
then netfilter is a good choice, and what you want to do is called 
"masquerading".   Check out the documents available at 
http://www.netfilter.org/documentation (especially the tutorials at the 
bottom) and you will find several guidelines to help you.

If you mean something else, please re-post with a more specific requirement 
and we'll see if we can help.

Regards,

Antony.

-- 
In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

                                                     Please reply to the list;
                                                           please don't CC me.


