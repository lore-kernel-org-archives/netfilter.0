From: Robert La Ferla <robertlaferla@attbi.com>
Subject: HELP - NetMeeting, H323, 2.4.19pre9 and newnat13
Date: Sat, 01 Jun 2002 10:41:56 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CF8DD34.6F5A0B40@attbi.com>
References: <000e01c1db28$d9e876f0$0300a8c0@yellow>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------BD502F16D3DB761CAB11C85A"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org


--------------BD502F16D3DB761CAB11C85A
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

I am trying to get NetMeeting to work using 2.4.19pre9, newnat13 and
H323.  I can get a chat and whiteboard connection.  I can occasionally
hear the other person but not 2-way audio or video.  This seems to be
worse than my older 2.4.17 configuration with newnat8.

One thing I noticed is that when I do a lsmod | grep h323, I see:

ip_nat_h323             2576   0  (autoclean) (unused)
iptable_nat            14672   3  (autoclean) [ipt_MASQUERADE
ip_nat_h323 ip_nat_ftp]
ip_conntrack_h323       2352   1  (autoclean)
ip_conntrack           16176   4  (autoclean) [ipt_MASQUERADE
ip_nat_h323 ip_nat_ftp ipt_state iptable_nat ip_conntrack_h323
ip_conntrack_ftp]

Notice that the ip_nat_h323 is unused.  Even if I dial using NetMeeting,
it remains unused.

How do I get this working?

Thanks,
Robert


--------------BD502F16D3DB761CAB11C85A
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
I am trying to get NetMeeting to work using 2.4.19pre9, newnat13 and H323.&nbsp;
I can get a chat and whiteboard connection.&nbsp; I can occasionally hear
the other person but not 2-way audio or video.&nbsp; This seems to be worse
than my older 2.4.17 configuration with newnat8.
<p>One thing I noticed is that when I do a <tt>lsmod | grep h323</tt>,
I see:
<p><tt>ip_nat_h323&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
2576&nbsp;&nbsp; 0&nbsp; (autoclean) (unused)</tt>
<br><tt>iptable_nat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
14672&nbsp;&nbsp; 3&nbsp; (autoclean) [ipt_MASQUERADE ip_nat_h323 ip_nat_ftp]</tt>
<br><tt>ip_conntrack_h323&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2352&nbsp;&nbsp;
1&nbsp; (autoclean)</tt>
<br><tt>ip_conntrack&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
16176&nbsp;&nbsp; 4&nbsp; (autoclean) [ipt_MASQUERADE ip_nat_h323 ip_nat_ftp
ipt_state iptable_nat ip_conntrack_h323 ip_conntrack_ftp]</tt>
<p>Notice that the ip_nat_h323 is unused.&nbsp; Even if I dial using NetMeeting,
it remains unused.
<p>How do I get this working?
<p>Thanks,
<br>Robert
<br>&nbsp;</html>

--------------BD502F16D3DB761CAB11C85A--


