From: Rinse Kloek <Rinse@solcon.org>
Subject: RE: Question about -m tos option
Date: Sat, 21 Jun 2003 14:08:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <70A180F483A4D611B18600E0810285C45CEEB4@EXCHANGE>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'Pavel V. Yanchenko'" <balrog@mail.ru>, netfilter@lists.netfilter.org

You need to patch iptables with the DSCP-target patch. Then you can use the
DSCP target to set all TOS values.

regards Rinse

-----Oorspronkelijk bericht-----
Van: Pavel V. Yanchenko [mailto:balrog@mail.ru]
Verzonden: donderdag 19 juni 2003 19:41
Aan: netfilter@lists.netfilter.org
Onderwerp: Question about -m tos option


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


