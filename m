From: Scott MacKay <scottmackay@yahoo.com>
Subject: Re: RFC 3514 support?
Date: Tue, 1 Apr 2003 10:36:11 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030401183611.37140.qmail@web13904.mail.yahoo.com>
References: <Pine.LNX.4.44.0304011310180.17145-100000@Sinister.Com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0304011310180.17145-100000@Sinister.Com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I plan to add it into my userspace mangler, but only
for suspicious source IP addresses (like ones which
resolve with dangerous works like 'sinister')   :)

I also intend to shortcut some of the design for item
(4) by simply having a toggled bit to determine if it
should be on or off (thus achieving true, pure, even
randomness)...

-Scott

--- Bob Keyes <bob@sinister.com> wrote:
> I am wondering if there are any plans to support RFC
> 3514 in netfilter?
> ftp://ftp.rfc-editor.org/in-notes/rfc3514.txt
> 
> Specifically, I'd like to tag all kazaa packets.


__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - File online, calculators, forms, and more
http://platinum.yahoo.com

