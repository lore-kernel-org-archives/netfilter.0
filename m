From: richard lucassen <mailinglists@lucassen.org>
Subject: iptables jump to userdefined chain and ESTABLISHED,RELATED rules
Date: Thu, 9 Oct 2003 22:20:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031009222051.40231552.mailinglists@lucassen.org>
Reply-To: netfilter@lucassen.org
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="pgp-sha1";
 boundary="Signature=_Thu__9_Oct_2003_22_20_51_+0200_bHO1Ikt_OVpK19d6"
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

--Signature=_Thu__9_Oct_2003_22_20_51_+0200_bHO1Ikt_OVpK19d6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
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

--Signature=_Thu__9_Oct_2003_22_20_51_+0200_bHO1Ikt_OVpK19d6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/hcMjyG85G+teVsIRAujIAJwJAE3+V3oKxfWdmFFztCEqb2zlIACghJ5y
R7Wnr5Zpmj3RNGdCYtG428w=
=2LfE
-----END PGP SIGNATURE-----

--Signature=_Thu__9_Oct_2003_22_20_51_+0200_bHO1Ikt_OVpK19d6--

