From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Passive FTP through IPTables DNAT
Date: Thu, 6 Mar 2003 22:12:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008d01c2e425$0938de80$0401000a@sterenborg.info>
References: <4D613EBFB75BD6118A5B00508BEEC62C0111CB53@JESS>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4D613EBFB75BD6118A5B00508BEEC62C0111CB53@JESS>
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

> Subject: Passive FTP through IPTables DNAT
> 
> 
> Does anyone have a working script for this? 
> I'm attempting to hide a FTP server behind a Linux IPTables 
> firewall using dnat but having problems 

Do you load the ip_conntrack_ftp and ip_nat_ftp modules ?

insmod ip_nat_ftp
insmod ip_conntrack_ftp

If so, and it doesn't work, what are your current rules ?


Rob


