From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: string v1.2.8 (I'm v1.2.5)  Message critical or not?
Date: Tue, 29 Apr 2003 18:38:53 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030430013853.60105.qmail@web40205.mail.yahoo.com>
References: <3EAE19E9.3030103@jetrentals.co.nz>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EAE19E9.3030103@jetrentals.co.nz>
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
To: David <david@jetrentals.co.nz>, netfilter@lists.netfilter.org


--- David <david@jetrentals.co.nz> wrote:
> Hi,
> 
> I have just used the P-O-M to enables "strings" with iptables. When I 
> set a rule using the "string" statement I get the message below. Is this 
> message an error message or just notification? While my rule work??
> 
> iptables: match `string' v1.2.8 (I'm v1.2.5).  
> Thanks
> 
> David.
> 
> 

Chances are you did not install the iptables after you fixed your kernel.
Or if you did... You are running a preinstalled version of iptables as opposed
to the version you want to run...

soloution... as root do this
updatedb
locate iptables | grep bin

you should see two completely different set of iptables (this happens when your
distro installs  a deb or rpm package of iptables and you latter install from
source)

one will prob be 
/sbin/iptables

another might be like
/usr/local/sbin/iptables

maybe

/usr/sbin/iptables

in eaither case... unistall the distrobution's package
updatedb and then locate the iptables command again

Hope this helps
J

=====
"No touchy NO TOUCHY! Emperor Kuzko -=Emperor's New Groove=-"

__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com

