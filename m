From: "Wayne McDougall" <system@codeworks.gen.nz>
Subject: [Q]: Filtering based on reserve DNS
Date: Sat, 12 Apr 2003 19:17:05 +1200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NCBBIBNHAKHDGJGMPLPJGEKAKPAA.system@codeworks.gen.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: netfilter@lists.netfilter.org

What I want to achieve is to filter based on a reverse name lookup on a =
source (and ideally destination) IP on initiating a connection.

Why? Because I'm in a country (island) where communication within the =
country is very cheap, and communication outside is metered and =
expensive. So I'd like to be able to apply traffic shaping (quotas and =
rate limiting) and policing with different polices applying to whether =
the IP is in my country or outside. I understand that reverse DNS does =
not always work and I'm quite happy to treat anyone like that as being =
outside. But if there IP resolve to *.nz I want to treat them =
differently to everyone else.

I appreciate that this sort of requirement isn't likely to be found in =
the USA (where I suspect most of y'all are), and I suspect it may not be =
very common elsewhere (anywhere else?). So I will understand if there =
isn't much interest or support for this.

My questions are:
1. Is there anything already like this (or could be adapted)?
2. Are there reasons why I shouldn't be doing this at all. I appreciate =
that there would be a performance hit , and obviously I only want =
reverse DNS lookups when connections are initiated - I don't mind =
latency at that point, and obviously I should use a local caching =
nameserver. But is it all a real mess and I shouldn't go there? Why not?
3. If there is nothing out there, where should I attack this problem if =
I was going to try and roll my own? A netfilter module, right?


Thank you for your time. I am new to this, so please forgive (and feel =
free to correct) any inappropriate use of terminology.


Regards

Wayne McDougall




