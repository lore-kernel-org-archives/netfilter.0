From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: open port to specific ip address
Date: Mon, 10 Nov 2003 12:15:26 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311101215.hAACFbj16813@agate.rockstone.co.uk>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAHvCSmpkyA0+lP5YKpr7djsKAAAAQAAAAX5TmzymhnkKWYhlmn/VLAwEAAAAA@petzetakis-africa.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAHvCSmpkyA0+lP5YKpr7djsKAAAAQAAAAX5TmzymhnkKWYhlmn/VLAwEAAAAA@petzetakis-africa.co.za>
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

On Monday 10 November 2003 12:01 pm, Lohan Spies wrote:

> Anthony,
>
> I tried this but it is not working! It is TCP
>
> I want to map (internal) 10.10.10.41 port 15000 to (external)
> 196.2.147.208 port 80.

Oh, sorry - you didn't say you wanted to change the port number as well as 
the address.

In that case change the DNAT rule to:

iptables -A PREROUTING -t nat -d 10.10.10.41 -p tcp --dport 15000 -j DNAT
--to 196.2.147.208:80

> And then if anything from ip 196.2.147.208 port 80 comes back it must be
> forwarded to 10.10.10.41 port 15000.

That will be automatically handled by your connection tracking rules.

> And then if I do this mapping will all cgi-scripting and authentication
> be disabled?

Netfilter has no effect on layer 7 protocols (content).   The result will be 
exactly the same as if you had connected to 196.2.147.208 port 80, except you 
can now get to it on 10.10.10.41 port 15000 as well.

Antony.

-- 

"I'm doing a (free) operating system (just a hobby, won't be big and 
professional like gnu) for 386(486) AT clones.

It is NOT portable , and it probably never will support anything other than 
AT-harddisks, as that's all I have :-(."

 - Excerpt from posting to comp.os.minix by Linus Torvalds, 25 Aug 1991
                                                     Please reply to the list;
                                                           please don't CC me.

