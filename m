From: "Matt Parlane" <matt@zevi.net>
Subject: Re: Web Browser Information Leakage through NetFilter:
Date: Fri, 27 Sep 2002 13:44:48 +1200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <02b801c265c7$76f489b0$0200a8c0@bart>
References: <FLEKIPPLAEDMJMOOBBDPGEBBDAAA.stewart.thompson@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: stewart.thompson@shaw.ca, netfilter@lists.netfilter.org

> I was redirected to some German web site.
> I couldn't read the text obviously, but the gist was I
> was insecure, it showed a completely accurate listing
> of all the folders on my Windows machine I was using
> the browser on at the time. Obviously I wasn't to please
> about this. I am assuming it is a function of the Browser
> and Server, and not a direct problem with my firewall.
> I am running IE V6 on that machine.
> So the question is, can a malicious website access
> Sensitive data with this method? Is there some way to block
> this with Netfilter and/or Browser settings?

Hi Stu...

This is probably an IFrame with a location of file:///C:/ which basically
shows you a listing of your c:\ directory.  Pretty sneaky... but rest
assured that if this is what it is, they can't get at anything on your
machine.

Matt


