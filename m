From: "Pavel V. Yanchenko" <balrog@mail.ru>
Subject: Question about -m tos option
Date: Thu, 19 Jun 2003 21:41:03 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <154232263.20030619214103@mail.ru>
Reply-To: "Pavel V. Yanchenko" <balrog@mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hello.

I need to create a rule matching packets with 0x60 value of TOS field.
The standard tos option of iptables doesn't accept such value, as well
as dscp, which is extension to tos - it processes only 6 bits of TOS
field :(
I guess value 0x60 is precedence bits...

The question is: how can I match such packets?

Thanks in advance.

  

Best regards,
 Pavel                          mailto:balrog@mail.ru


