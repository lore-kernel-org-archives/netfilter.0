From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>
Subject: Re: Order in ruleset edition
Date: Wed, 26 Nov 2003 17:27:15 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001e01c3b45b$af4cb790$95ffa8c0@ESTACAO>
References: <D8FBABA1EF6F2E4DBCC88903F60691F3023F1584@houxchsvr.ucscorp.ucs.pvt>
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
To: "Hildebrand, Brian" <BrianHildebrand@universalcomputersys.com>, "Netfilter (E-mail)" <netfilter@lists.netfilter.org>


    To prevent problems during a firewall reload/restart, I usually do:

    1) do 'echo 0 > /proc/sys/net/ipv4/ip_forward' on the very beggining of
the script
    2) define the default actions to drop on the very first rules ( -P
DROP )
    3) insert ALL the rules (can take some seconds)
    4) do 'echo 1 > /proc/sys/net/ipv4/ip_forward'
    5) firewall is READY

    What do you think on this ?

    Sincerily,
    Leonardo Rodrigues


