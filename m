From: richard lucassen <netfilter@lucassen.org>
Subject: iptables jump to userdefined chain and ESTABLISHED,RELATED rules
Date: Fri, 10 Oct 2003 13:26:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031010132641.2591d3b5.netfilter@lucassen.org>
Reply-To: netfilter@lucassen.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="Multipart=_Fri__10_Oct_2003_13_26_41_+0200_G+DxLsakYyA/s4JB"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

--Multipart=_Fri__10_Oct_2003_13_26_41_+0200_G+DxLsakYyA/s4JB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

I want all traffic on port 80 be handled by a userdefined chain
"CH_WWW". Now my question: What is better, this way (I let the port
80 packets jump first, then I have _two_ ESTABLISHED,RELATED rules, as
well in the INPUT as in the CH_WWW chain):

********************************************************************
${IPT} -A INPUT -p tcp --dport 80 -j CH_WWW
${IPT} -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
[..]

And an extra ESTABLISHED,RELATED in the CH_WWW:
${IPT} -A CH_WWW -m state --state ESTABLISHED,RELATED -j ACCEPT
${IPT} -A CH_WWW (first rule)
[..]
********************************************************************

or this (I have _one_ ESTABLISHED,RELATED rule, and then let port 80 
jump):

********************************************************************
${IPT} -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
${IPT} -A INPUT -p tcp --dport 80 -j CH_WWW
[..]

And an extra ESTABLISHED,RELATED in the CH_WWW:
${IPT} -A CH_WWW (first rule)
[..]
********************************************************************

Both ways work, but I'd say the second way is the best. Am I right?

Richard.

-- 
___________________________________________________________________
Recursion: see recursion

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
| Public key and email address:                                    |
| http://www.lucassen.org/mail-pubkey.html                         |
+------------------------------------------------------------------+


--Multipart=_Fri__10_Oct_2003_13_26_41_+0200_G+DxLsakYyA/s4JB
Content-Type: application/pgp-signature;
 name="00000000.mimetmp"
Content-Disposition: attachment;
 filename="00000000.mimetmp"
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuMi4xIChHTlUv
TGludXgpCgppRDhEQlFFL2hjTWp5Rzg1Ryt0ZVZzSVJBdWpJQUp3SkFFMytWM29LeGZXZG1GRnp0
Q0VxYjJ6bElBQ2doSjV5ClI3V25yNVpwbWozUk5HZENZdEc0Mjh3PQo9MkxmRQotLS0tLUVORCBQ
R1AgU0lHTkFUVVJFLS0tLS0KCg==

--Multipart=_Fri__10_Oct_2003_13_26_41_+0200_G+DxLsakYyA/s4JB--

