From: Michael Gale <mgale@utilitran.com>
Subject: NATing out going packets
Date: Wed, 10 Dec 2003 09:49:47 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031210094947.49b59fdf.mgale@utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hello,

	I have kind of a dumb question :)

Right now I have the following rule for NATing out going traffic.

$IPT -t nat -A POSTROUTING -o $EXT_FACE -s ! $EXT_IP -j SNAT --to-source $EXT_IP

I did not want to specify a source network because I have a few and wanted to only have one rule. It seems to be working fine ... any thoughts would be appreciated.

I guest I am sort of new to building my own rules and just want to make sure I am doing everything correctly. :)

-- 
Michael Gale
Network Administrator
Utilitran Corporation

