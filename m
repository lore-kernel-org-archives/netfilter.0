From: "Scott Knake" <sknake@Apexsoftware.com>
Subject: RE: how to delete a group of rules (nfcan: addressed to
	exclusivesender for this address)
Date: Sat, 27 Nov 2004 23:59:49 -0500
Message-ID: <424BCB4EA242A1429A8AF0548E8CFF0E123996@apexexchange.ApexSoftware.Com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Why don't you just use iptables-restore < `iptables-save | grep -v 'x1'`
after flushing the chain in question and removing it? I'm not sure if
the syntax above will work but it's the concept that I'm trying to
convey.

-Scott
>On 2004.11.27 12:17, Alexis - alexis@tpys.com.ar wrote:
>> Hi all, im coding a frontend for iptables based on php and mysql.
>>=20
>> But i have an issue when i try to delete a group of rules, it cant be
done.
>>=20
>> suppose this
>>=20
>> a chain called "x1"
>>=20
>> delete the chain implies
>>=20
>> - empty the chain
>> - delete all  rules that reference the chain
>
>For what its worth, I would empty the chain
>after I deleted the references.
>
>>=20
>> the first line is easy to do  with iptables -F x1 , but if (as an
example)
>> in filter::INPUT i have 2 or more references to this chain, executing
>> iptables -D INPUT -j x1 will delete only the first one and not all
rules
>> that references x1.
>
>I believe that any rule can be deleted by specifying the exact
parameters
>used to create it, that is changing the -A for instance to -D, leaving
>the rest of the command unchanged (for example -p tcp, or -d x.x.x.x,
etc.).
>
>Surely each rule in a table has a unique pattern, or why would it be
there?
>
>This does not, as you say, allow for deletion of a group of related
commands,
>however, it should let you accomplish what you need to do.
>
>Just delete the rules iteratively, one at a time,
>creating the delete commands from those used to add each rule.
>
>I hope that helps.
>
>Jim
>



