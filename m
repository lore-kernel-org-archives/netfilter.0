From: "Michael Klinteberg" <micke@klintan.se>
Subject: Re: iptables wishes
Date: Tue,  1 Apr 2003 11:58:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304011158.AA220332250@klintan.se>
Reply-To: <micke@klintan.se>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org, netfilter@newkirk.us



---------- Original Message ----------------------------------
From: Joel Newkirk <netfilter@newkirk.us>
Reply-To: netfilter@newkirk.us
Date: Tue, 1 Apr 2003 03:41:48 -0500

>I haven't started a new thread here in ages, and this is 
something I've 
>been toying with for a while.  With the recent announcement of a 
>feature-freeze on iptables 1.2.8, this seemed a reasonable time 
to start 
>this thread.  (targeting later releases, obviously, and hoping to 
spark 
>some constructive discussion :^)
>
>I was curious to hear what people might have as a 'wishlist' for 
>iptables/netfilter capabilities.  Every once in a while something 
comes 
>up here that simply doesn't seem to have a good solution.
>
>My hope is that many of our personal wishes may already be 
possible, and 
>by voicing them someone who has a solution may post it.  And for 
any 
>that don't presently have an answer, perhaps someone will be 
inspired to 
>create one.
>
>Personally I have four:
>
>1 - revamped LOG entry format, especially cleaning up MAC.
I also want this feature.

>
>2 - completely separate netfilter logging from kernel log 
streams.  (not 
>just redirecting infrequently-used kernel streams, but actual 
dedicated 
>netfilter streams)
Ohh yes!!! This is also "a must have". An extended to this yould 
be to log to diffrent files for diffrent rules. Something like
iptables -A INPUT -s bad.host.net --log-
file /var/log/netfilter/bad.hosts -j LOG

>
>3 - Ability to match "original DestinationIP" of a DNATted packet 
in 
>subsequent chains.  Useful with a single physical interface but 
multiple 
>IPs bound to it.
>
>4 - addition of support for a REM field in rules.  Would do 
nothing 
>whatsoever except print the specified REMark text at the end of 
the rule 
>in -L listings.  Something like:
>iptables -A INPUT -p tcp --dport 22 -s a.b.c.d -j ACCEPT -REM 
JoelSSH
>So that a -L listing could be easier & quicker to decipher 
sometimes.  It 
>would also allow "iptables -L -v -n | grep Joel" to list only 
rules, in 
>all chains, with "Joel" in the comment.
This is also god :-)


Another thing to the wishlist (for me, that is)
When listing(-L) with verbose (-v) I wish to remove some fileds. 
Today I must use the awk command to do this. Resulting in very 
long command.
Something like:
iptables -L -v -opt -source +REM
would remove the opt and source fields and; add the REM field if 
not default when listing with verbose.
>
>
>j
>
/Klintan 

________________________________________________________________
Sent med Stib Webmail, en tj=E4nst p=E5 klintan.se


 
                   


