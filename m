From: Tomasz Korycki <engine2@flow.mine.nu>
Subject: Re: How filter IP address if it *changes* often?? (think dhcp)
Date: Fri, 28 Mar 2003 14:06:13 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.0.20030328140606.06616cd0@mail.flow.north.net>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

At 01:26 2003-03-28, you wrote:
>Steve
>
>Thanks for the email.  Let me rerephrase my question.
>Perhaps I wasn't clear....
>
>How can you have a rule on your INPUT chain that
>only allows your local box's IP address if "local box IP address" can
>change without notice due to your DSL ISP's decision?

1. install and configure dhcpcd
2. it will install /etc/dhcpc/dhcpcd.exe, which is a script
3. open dhcpcd.exe. Read it.
4. At the end, there is a switch case, where You can take different actions if:
   4.1. the if has been brought up with the same IP
   4.2. the if has been brought up with new IP
   4.3. the if has been brought down
5. Obviously, You're interested in 4.2. I just call another script there, 
called restart-fw
6. In restart-fw I:
   6.1. shut down routing
   6.2. get the if's new IP
   6.3. start firewall with that new IP
   6.4. enable routing
7. salt and pepper to taste...



