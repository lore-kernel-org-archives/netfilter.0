From: "Kilson Arruda" <iptables@onwave.com.br>
Subject: Transparent Proxy
Date: Wed, 10 Sep 2003 18:19:31 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030910221931.2F3C159ACC@pandora.onwave.com.br>
Reply-To: "Kilson Arruda" <iptables@onwave.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"; 
To: netfilter@lists.netfilter.org

I have a Transparent Proxy like this

$IPTABLES -t nat -A PREROUTING -p tcp
--dport 80 ! -d $DIRECT_IP -m mac --mac-source $MAC -j REDIRECT --to-port
3128

Question: can I use more then one "! -d", or multiple IPs to don't REDIRE=
CT
the port 80 for more then one IP?
If yes, how can I do this?

--
Kilson Arruda
Linux User # 228238


________________________________________________
www.onwave.com.br - Internet e Conectividade


