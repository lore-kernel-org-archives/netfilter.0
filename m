From: "Tony Thompson" <tony.thompson@stone-ware.com>
Subject: Re: Do I need to write a module?
Date: Tue, 24 Jun 2003 10:22:52 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <sef8269b.024@mail.stone-ware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Thanks for the response.  Maybe I should give a better picture of what I
am trying to do.  I have a private network that I am trying to route
through a Linux box.  I want to deny all traffic (from a MAC address)
until a user authenticates, with their browser, to a Java application on
the Linux server (when they authenticate, something has to happen to let
netfilter know that the MAC address is allowed to pass).  There has to
be some level of coordination at that point between the Java app and
netfilter so that session timeouts, etc. can be handled.  I would like
to have all of this happen as close to real time (i.e. not batched) as
possible.

After writing this out, maybe I don't even need a module but, just a
way to control netfilter from a Java app.  I am still open to
suggestions...

Thanks.
Tony

>>> Ray Leach <raymondl@knowledgefactory.co.za> 06/24/03 01:57AM >>>
Hi

Why don't you get the Java app to export some kind of text that you
can
get netfilter to parse with regular unix utilities (sed, awk, grep).

Create a cron job to parse the file every 10 minutes (if that's
regular
enough) that parses the text file and reloads your iptables rules as
per
the file.

Ray

On Mon, 2003-06-23 at 20:43, Tony Thompson wrote:
> I am investigating an option to use netfilter to allow/deny traffic
from
> the local subnet based on rules/accounting information that is in
> another (Java based) system.  I am new to netfilter so, I can
someone
> offer some suggestions:
> 
> 1. Is netfilter the right place to hook or should I look at a
firewall
> that may provide some higher level hooks for authentication and
> accounting?
> 
> 2. If I should hook into netfilter, is it a good idea to call into a
> JVM from a netfilter module?
> 
> 3. I am not sure what kind of control I have when using the
userspace
> driver but, should I use that in this situation?  Can I use that
> directly from Java so I wouldn't have the hassel of calling into a
JVM
> from a native process?
> 
> If anyone can offer any other suggestions or examples, that would be
> appreciated.
> 
> Thanks.
> Tony
-- 
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za 
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint = 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

