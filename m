From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: masquerde with 2-channel isdn link
Date: Sun, 11 Jan 2004 22:20:46 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401112220.46062.Antony@Soft-Solutions.co.uk>
References: <1774226640.1073858820301.JavaMail.nobody@app1.ni.bg>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1774226640.1073858820301.JavaMail.nobody@app1.ni.bg>
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

On Sunday 11 January 2004 10:07 pm, Radoslav Mitov wrote:

> Hi Everybody,
> I use 2-channel (ippp0 & ippp1) isdn link to connect with internet,
> but i don't know, howto masquerade my outgoing traffic with both channels,
> so currently i use only ippp0. Is there someone ,who had a common problem.

Two separate interfaces sounds a bit unusual to me (although it's a long time 
since I used ISDN).   Shouldn't the choice be between one interface running 
at 64k or one interface running at 128k?   I think this is an option in the 
isdnctrl setup, telling it to bond the two underlying channels together 
before binding them to an ippp interface?

It surely isn't a netfilter problem - you can easily do masquerading on both 
interfaces with netfilter, but you will only be using one of the them as your 
default route.

Try the man page for isdnctrl I think.

Antony.

-- 
Your work is both good and original.  Unfortunately the parts that are good 
aren't original, and the parts that are original aren't good.

 - Samuel Johnson

                                                     Please reply to the list;
                                                           please don't CC me.


