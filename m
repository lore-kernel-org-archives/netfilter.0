From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Update Iptables in order to use String-Match
Date: Sun, 2 Apr 2006 22:23:46 +0200
Message-ID: <001701c65693$58272720$0101000a@sterenborg.info>
References: <443012E6.3050204@hin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <443012E6.3050204@hin.de>
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

>> Dunno.. The crystal ball is a bit cloudy today. Any error messages ?
>> oh I 've forgotten: 
> 
> linux:/usr/local/lib/iptables # iptables -m string -h
> iptables: match `string' v1.3.3 (I'm v1.3.5)

So your iptables isn't installed or installed in a different path than
the original.

>> You have "updated some versions of p-o-m". What do you mean by that
>> ? What have you done exactly ? 
>> 
>> Have you :
>> - untarred the kernel,
>> - untarred POM,
>> - untarred iptables,
> all yes
> 
>> - patched both the kernel and iptables with POM,
> yes, but don't add string-match

So that's where things go wrong : if it doesn't show up, you couldn't
have patched the kernel for it.

The string match is in the Extra repository. Did you run POM with
"./runme extra" ?
http://www.netfilter.org/projects/patch-o-matic/pom-extra.html#pom-extra
-string

>> - compiled and installed the kernel and modules,
> yes, but no string-match modul seen in kernel menuconfig

See above.

>> - compiled and installed iptables ?
> yes

I think not completely.
What does "iptables -V" say ? (Mine says : "iptables v1.3.5-2006xxxx")


Gr,
Rob


