From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: managing another network route, can't connect to it! Pls see!
Date: Wed, 26 Feb 2003 15:04:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030226150447.435f450b.arnt@c2i.net>
References: <030f01c2dd88$2f277140$0b00000a@nocpc3>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <030f01c2dd88$2f277140$0b00000a@nocpc3>
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


..'info ifconfig', you wanna do 'ifconfig eth1:0 192.168.129.254 up' 
or somesuch, on your gw.  The new boxes on that net needs to know 
where to go, too.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



