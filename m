From: "Olexandr O. Galay" <root@e-mail.te.ua>
Subject: Re[2]: ipt_connlimit trouble
Date: Sun, 1 Feb 2004 13:21:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <13687727281.20040201132148@e-mail.te.ua>
References: <19730527125.20040131212831@e-mail.te.ua>
 <GFEPJIHHFOJDOFDMNAJDAECIFEAA.mark@npsl.co.uk>
Reply-To: "Olexandr O. Galay" <root@e-mail.te.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <GFEPJIHHFOJDOFDMNAJDAECIFEAA.mark@npsl.co.uk>
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
To: Netfilter List <netfilter@lists.netfilter.org>

Hello, Mark!

Replying to your letter:



>> 4. compile and install kernel with all options of iptables sets
>> to M (module)
M> Missing a reboot step here?
No, i reboot machine when installed new kernel

>> so, now when i trying to # modprobe ipt_connlimit i get:
>> [root@test /]# modprobe ipt_connlimit
>> /lib/modules/2.4.24/kernel/net/ipv4/netfilter/ipt_connlimit.o:
>> unresolved symbol ip_conntrack_find_get
M> Also try depmod -e -F /<path>/System.map and see if you still get the same
M> problem.
I make depmod -e -F /usr/src/linux-2.4.24/System.map
But ipt_connlimit not loads :(



-- 
Best Regards, Mark!

Sunday, February 1, 2004, 13:20

Olexandr O. Galay
mailto:root@e-mail.te.ua
http://www.macros.org.ua
ICQ: 29292281


