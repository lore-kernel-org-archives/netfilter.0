From: "Michael K" <micke@klintan.se>
Subject: RE: PASV rules opening up my high-ports - Whoops - sent the first one in HTML
Date: Tue, 27 May 2003 00:52:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002e01c323d9$72974ee0$0200a8c0@klintan.local>
References: <FKEKLDLBAFLHIMEKAJJAIECJCAAA.jherschel@quarry.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FKEKLDLBAFLHIMEKAJJAIECJCAAA.jherschel@quarry.com>
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



> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of jherschel
> Sent: Monday, May 26, 2003 10:01 PM
> To: netfilter@lists.netfilter.org
> Subject: PASV rules opening up my high-ports - Whoops - sent 
> the first one in HTML
> 
> 
> Howdy,
> 
> Thanks in advance for reading this, if this is a common 
> issue, I apologize - but could you point me to a searchable 
> archive so I don't bug this list with previously asked questions?
> 
> Anyways - here goes .
> 
> I've got rules for FTP inbound/outbound for both PORT and 
> PASV connections. I'm also running MySQL, which defaults to port 3306.
> 
> If FTP PASV rules are enabled, either as a server or client, 
> it seems all my high ports are open to be connected to.  I've 
> tried enforcing state, but I end up either breaking the rule 
> so that FTP doesn't work, or I end up opening the high-ports again.
> 
> Is there a way to fix this by developing a better rule? Or 
> should I limit my PASV ports to a range that does not overlap 
> with other services?
> 

Something like this

iptables -A INPUT -m state --state ESTABISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABISHED,RELATED -j ACCEPT
#Passive and active ftp
modprobe ip_conntrack_ftp
#FW to FTP servers
iptables -A OUTPUT -p tcp --dport 21 -j ACCEPT
#FTP Clients to FW
#iptables -A INPUT -p tcp --dport 21 -j ACCEPT

/Klintan



