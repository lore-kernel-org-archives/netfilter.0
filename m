From: Mark Seamans <marks@crvinc.com>
Subject: scripting issue
Date: Tue, 1 Apr 2003 15:43:54 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304011543.54597.marks@crvinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: Netfilter <netfilter@lists.netfilter.org>

Although this doesn't have anything to do with iptables, I do 
believe that you will have the best answer. Simple script that will 
insert a line in a remote server's named.conf.  BUT IT WONT WORK!  
I have been beating my head.  I have seen some pretty fancy shell 
scripts in this list so here is the command I am using:
I am trying to create a little menu that will make it eaiser for non-linux
users to manage dns....Personally, I like VI, but hey...

Variables:
NAMEDCFG="/etc/bind/named.conf
DOMAINNAME= script asks user this question....
NS2=....server ip number.

${SSH} -l root ${NS2} echo -e "zone \"${DOMAINNAME}\" {" >> '${NAMEDCFG}''
${SSH} -l root ${NS2} echo -e "     type slave;" >> ${NAMEDCFG}
${SSH} -l root ${NS2} echo -e "     file \"sec/dbsec.${DOMAINNAME}\";" >> ${NAMEDCFG}
${SSH} -l root ${NS2} echo -e "     masters { 10.10.10.10; };" >> ${NAMEDCFG}
${SSH} -l root ${NS2} echo -e "};" >> ${NAMEDCFG}

Now any other command works like this:
${SSH} -l root ${NS2} ${TAR} -cf ${NAMEDCFG}.${DATE}.tar ${NAMEDCFG} > /dev/null 2>&1

But the above echo statetment just echo's the data to the LOCAL named.conf not to the remote system.
Any words of advice would be great.  I'm sure that someone out there has ran across this.  If there is a
better way, please note it.

Thanks,
Mark

