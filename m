From: George Georgalis <georgw@galis.org>
Subject: Re: Controlling bandwith rate on port 80
Date: Tue, 11 Jun 2002 16:35:05 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020611163505.A12692@trot.haven.dom>
References: <001501c1b33a$7b9238e0$0200a8c0@terr1> <1023826204.4183.71.camel@billy.demon.nl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <1023826204.4183.71.camel@billy.demon.nl>; from tonni@billy.demon.nl on Tue, Jun 11, 2002 at 10:10:03PM +0200
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Earnshaw <tonni@billy.demon.nl>
Cc: iptables <iptables@linuxgeek.dk>, netfilter@lists.samba.org


On Tue, Jun 11, 2002 at 10:10:03PM +0200, Tony Earnshaw wrote:
>man, 2002-02-11 kl. 21:27 skrev iptables:
>> Im using debian unstable, kernel 2.4.18, iptables 1.2.6a.
>>  My max upload bandwith is 30kb, i want to limit the traffic
>> on port 80 to around 25kb. Is this possible and how? any HOWTO's on
>> this subject?`
>
>Definitely. But not with iptables.
>
>http://www.tldp.org/HOWTO/Adv-Routing-HOWTO.html
>
>You might wish to bookmark this site. It's where many HOWTOs are at.
>


Not iptables but you probably want the apache mod_throttle for that.
google says:
http://www.snert.com/Software/mod_throttle/

// George



-- 
GEORGE GEORGALIS, System Admin/Architect    cell: 347-451-8229 
Security Services, Web, Mail,            mailto:george@galis.org 
File, Print, DB and DNS Servers.       http://www.galis.org/george 


