From: "Jonathan" <infomail@nobarrier.co.za>
Subject: source and destination rule
Date: Mon, 21 Apr 2003 10:42:10 +0200 (SAST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <35903.196.35.22.18.1050914530.squirrel@www.nobarrier.co.za>
Reply-To: infomail@nobarrier.co.za
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

Hi there all

I would like to add a rule that has a source ip and a destination ip
address and have a problem doing con someone point me in the correct
direction.
this is the rule i have tried

$IPTAB -A FORWARD -p tcp --dport 22 -i eth1 -s 192.168.1.0/24 -d
192.168.45.0/24 -syn -m state --state NEW -j ACCEPT


______________________________________
Mail has been scanned and protected by No Barrier Communications
www.nobarrier.co.za

