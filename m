From: "Amit Kumar Gupta" <amitkumar.gupta@wipro.com>
Subject: Reg iptables Connection tracking
Date: Fri, 10 Jan 2003 10:33:48 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4223A04BF7D1B941A25246ADD0462FF5647695@blr-m3-msg.wipro.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPartTM-000-f1f145df-04b2-4498-b98d-1812fc79b501"
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

------=_NextPartTM-000-f1f145df-04b2-4498-b98d-1812fc79b501
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable


Hi List,

I am getting a problem with iptables :-=20

I have added some rules in which I check the states of the packets which
I receive i.e. whether it is NEW, ESTABLISHED or INVALID and then do
some actions.

Now the problem which I am getting is :- (However I have already posted
a si ilar query reg this but I think this will be more elaborative).

As soon as somebody pings to my m/c , that fellow doesn't get the reply
and on my m/c , kernel keeps dumping certain messages which are like
this :-

Ip_contrack: maximum limit of 1016 entries exceeded.

Please help.=20

Thanks & Regards,

Amit Kumar Gupta.

------=_NextPartTM-000-f1f145df-04b2-4498-b98d-1812fc79b501
Content-Type: text/plain;
	name="Wipro_Disclaimer.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="Wipro_Disclaimer.txt"

**************************Disclaimer************************************************

Information contained in this E-MAIL being proprietary to Wipro Limited is 
'privileged' and 'confidential' and intended for use only by the individual
 or entity to which it is addressed. You are notified that any use, copying 
or dissemination of the information contained in the E-MAIL in any manner 
whatsoever is strictly prohibited.

***************************************************************************************

------=_NextPartTM-000-f1f145df-04b2-4498-b98d-1812fc79b501--

