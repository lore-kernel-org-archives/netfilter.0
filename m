From: Kelly Setzer <Kelly.Setzer@placemark.com>
Subject: Re: scripting issue
Date: Tue, 1 Apr 2003 16:41:30 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030401224130.GK19832@placemark.com>
References: <200304011543.54597.marks@crvinc.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200304011543.54597.marks@crvinc.com>
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
Content-Transfer-Encoding: 7bit
To: Mark Seamans <marks@crvinc.com>
Cc: netfilter@lists.netfilter.org

On Tue, Apr 01, 2003 at 03:43:54PM -0600, Mark Seamans wrote:
> Although this doesn't have anything to do with iptables, I do 
> believe that you will have the best answer. Simple script that will 

> NAMEDCFG="/etc/bind/named.conf
> DOMAINNAME= script asks user this question....
> NS2=....server ip number.

> ${SSH} -l root ${NS2} echo -e "zone \"${DOMAINNAME}\" {" >> '${NAMEDCFG}''
> ${SSH} -l root ${NS2} echo -e "     type slave;" >> ${NAMEDCFG}
> ${SSH} -l root ${NS2} echo -e "     file \"sec/dbsec.${DOMAINNAME}\";" >> ${NAMEDCFG}
> ${SSH} -l root ${NS2} echo -e "     masters { 10.10.10.10; };" >> ${NAMEDCFG}
> ${SSH} -l root ${NS2} echo -e "};" >> ${NAMEDCFG}

#!/bin/bash
# don't quibble about my choice of bash
NAMEDCFG="/etc/bind/named.conf
DOMAINNAME= script asks user this question....
NS2=....server ip number.

{
cat <<EOF

zone ${DOMAINNAME} {
	type slave;
	file "sec/dbsec.${DOMAINNAME}";
	masters { 10.10.10.10; };
};
EOF
} | ${SSH} root@${NS2} "cat - >> $NAMEDCFG"


Kelly

--
Kelly Setzer, System Administrator/Architect - Placemark Investments
14180 Dallas Pkwy, Suite 200, Dallas, TX 75240
kelly.setzer@placemark.com  http://www.placemark.com
(972)404-8100x41 (work)       (214) 287-3464 (cell)

