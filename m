From: "hallian hallian" <hallian@hotmail.com>
Subject: ip_conntrack_lock not readlocked? anyone?
Date: Wed, 16 Oct 2002 16:18:49 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F2421sZV4CllPF6p0V700001255@hotmail.com>
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
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

<html><div style=3D'background-color:'><DIV>
<DIV><FONT face=3DArial size=3D2>hello -</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I was wondering if anyone has seen this er=
ror/warning message before? What does it mean?&nbsp; Any idea? </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>regards,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>hallian</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>=3D=3D=3D</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Oct 13 11:50:18 f kernel: ASSERT ip_nat_co=
re.c:739 &amp;ip_conntrack_lock_Rsmp_4193d6ac readlocked<BR>Oct 13 11:50:18=
 f kernel: ASSERT ip_conntrack_core.c:91 &amp;ip_conntrack_lock_Rsmp_4193d6=
ac readlocked<BR>Oct 13 11:50:18 f kernel: ASSERT: ip_nat_core.c:743 &amp;i=
p_conntrack_lock not readlocked<BR>Oct 13 11:50:18 f kernel: ASSERT ip_conn=
track_core.c:977 &amp;ip_conntrack_lock not readlocked<BR>Oct 13 11:50:18 f=
 kernel: ASSERT: ip_nat_core.c:840 &amp;ip_conntrack_lock not readlocked<BR=
>Oct 13 11:50:18 f kernel: ASSERT ip_nat_core.c:739 &amp;ip_conntrack_lock_=
Rsmp_4193d6ac readlocked<BR>Oct 13 11:50:18 f kernel: ASSERT ip_conntrack_c=
ore.c:91 &amp;ip_conntrack_lock_Rsmp_4193d6ac readlocked<BR>Oct 13 11:50:18=
 f kernel: ASSERT: ip_nat_core.c:743 &amp;ip_conntrack_lock not readlocked<=
BR>Oct 13 11:50:18 f kernel: ASSERT: ip_nat_core.c:840 &amp;ip_conntrack_lo=
ck not readlocked</FONT></DIV></DIV></div><br clear=3Dall><hr>Broadband?=A0=
Dial-up? Get reliable M
 SN Internet Access. <a href=3D"http://g.msn.com/8HMAEN/2016">Click Here</a=
> </html>

