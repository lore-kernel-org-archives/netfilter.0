From: alok.shukla@soft.dil.in
Subject: Exempt one IP from DNAT for the whole network
Date: Wed, 21 Jan 2004 16:38:20 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <747032.1074683300483.JavaMail.root@newdil25>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_289_8120628.1074683300482"
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

------=_Part_289_8120628.1074683300482
Content-Type: text/html
Content-Transfer-Encoding: 7bit

<DIV>hi everybody ,,, </DIV>
<DIV>I have a unique problem. </DIV>
<DIV>&nbsp;</DIV>
<DIV>I have created a rule in the prerouting chain in the nat table to DNAT every packet coming from 10.11.12.0/24 network to the webserver running on the local machine</DIV>
<DIV>&nbsp;</DIV>
<DIV>Now i want one of the IP from this pool to be exempted from this rule. I had put a rule in the mangle table so as to RETURN&nbsp; from prerouting chain.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I think that this RETURN is not working. I would like to know the other ways i can make a machine exempted from the DNAT that is occuring.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Kindly suggest</DIV>
<DIV>&nbsp;</DIV>
<DIV>Alok Shukla</DIV><br><font size=1> 
------=_Part_289_8120628.1074683300482
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Powered by Xgen(Next Generation Email Client)
http://www.datainfosys.com
Do not remove this:[XGEN]210120043820224284:NM[-XGEN-]
------=_Part_289_8120628.1074683300482--


