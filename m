From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: Web Browser Information Leakage through NetFilter:
Date: Thu, 26 Sep 2002 17:52:45 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPEEBEDAAA.stewart.thompson@shaw.ca>
References: <000001c265bc$52e1c520$6601a8c0@s3ac>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <000001c265bc$52e1c520$6601a8c0@s3ac>
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
To: Rowan Reid <rreid@studio3arc.com>, netfilter@lists.netfilter.org

Hi Rowan:

	Thanks for the reply. IT may be the second option where it
shows you it locally. It is an accurate display of my C drive. Not a
generic one. I run Norton every day. First it does a live update, then
a full system scan. So, I am pretty sure I don't have any viruses.
I have security on IE6 set to high, likewise for cookies, but it still
seems to act the same.

Stu........


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Rowan Reid
Sent: September 26, 2002 5:25 PM
To: stewart.thompson@shaw.ca; netfilter@lists.netfilter.org
Subject: RE: Web Browser Information Leakage through NetFilter:


This may be a hoax, In the past I've seen pages that have
Java scripts which do one of two things, they list a generic
Windows 98 C drive configuration. The page scrolls by so fast is seems
it has you exact drive contents. The next one I've seen is an actual
java script that reads your drive locally and makes it look like it's on
the page but I don't think IE allows this anymore. The third and most
likely possibility is you have been nimda and it's left your shares
open. In order to do this though yoru firewall needs to allow port 138

> was insecure, it showed a completely accurate listing
> of all the folders on my Windows machine I was using
> the browser on at the time. Obviously I wasn't to please
> about this. I am assuming it is a function of the Browser
> and Server, and not a direct problem with my firewall.
> I am running IE V6 on that machine.
>       So the question is, can a malicious website access
> Sensitive data with this method? Is there some way to block
> this with Netfilter and/or Browser settings?
>



