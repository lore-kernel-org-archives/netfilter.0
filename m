From: Jochen Vogel <jvogel@it-sec.de>
Subject: iptables - bridge - physin
Date: Tue, 1 Apr 2003 12:18:42 +0200
Sender: bridge-admin@math.leidenuniv.nl
Message-ID: <D3DD55FDB74AD511BA51005004163680176597@orion.ibh.de>
Mime-Version: 1.0
Return-path: <bridge-admin@math.leidenuniv.nl>
Errors-To: bridge-admin@math.leidenuniv.nl
List-Unsubscribe: <http://www.math.leidenuniv.nl/mailman/listinfo/bridge>,
	<mailto:bridge-request@math.leidenuniv.nl?subject=unsubscribe>
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:bridge@math.leidenuniv.nl>
List-Help: <mailto:bridge-request@math.leidenuniv.nl?subject=help>
List-Subscribe: <http://www.math.leidenuniv.nl/mailman/listinfo/bridge>,
	<mailto:bridge-request@math.leidenuniv.nl?subject=subscribe>
List-Archive: <http://www.math.leidenuniv.nl/pipermail/bridge/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>, "'bridge@math.leidenuniv.nl'" <bridge@math.leidenuniv.nl>

hi all,

i compiled iptables and teh bridge patch.
all is working fine. but in my old iptables script i configured many rules
with -i and -o.
in the logs i can see, that iptables use as IN and OUT the bridge and have
an additional entry for PHYSIN.
is there an option to use the PHYSIN?

thx for help
jo
