From: "Maxime Ducharme" <mducharme@cybergeneration.com>
Subject: Question about -m string module
Date: Fri, 4 Feb 2005 10:23:57 -0500
Message-ID: <18ba01c50acd$8d4af340$b000a8c0@cybergeneration.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org


Hello guys

I have a question about -m string module and
I think you iptables geeks can answer me :)

Suppose I want to drop TCP connections with
specific requests.

Example : a mail which contains the word "sperm",

I'd add a rule like

$IPTABLES -t filter -A FORWARD -p tcp --dport 25 -d OURMAILSERVER \
    -m string --string "sperm" -j DROP

What is the reaction in the TCP connection ?

The further packets of the same connection get dropped too ?
This would mean the email cannot be sent, and stay in the foreign
mail server queue for X days ?

Would it be the same if I use a REJECT rule ?

Also, can fragmented TCP packets get through this ?

Thanks in advance

Maxime Ducharme
Programmeur / Sp=E9cialiste en s=E9curit=E9 r=E9seau



