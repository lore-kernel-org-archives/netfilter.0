From: Esteban <esteban@alstec.fr>
Subject: Re: radius
Date: Tue, 17 Jun 2003 18:50:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030617185021.0bfdfa24.esteban@alstec.fr>
References: <7C9884991ADAE0479C14F10C858BCDF5122DD5@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122DD5@alderaan.smgtec.com>
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
To: Daniel Chemko <dchemko@smgtec.com>
Cc: netfilter@lists.netfilter.org



On my LAN, I use an active switch which ask a login and password to the
user and authenticate this user on a radius server in order to let him
go througt the switch.

I was wondering if it was possible to tell netfilter to authentificate
user on a radius server before to accept the packets from this user.

If I am not wrong, I think some firewalls like Netscreen or Checkpoint
do such authentication

Is that more explicit ?

thank you very much.



-- 
Stephane DESMET
Alstec Informatique
17, rue du Colisee
75008 Paris


On Tue, 17 Jun 2003 08:40:44 -0700
"Daniel Chemko" <dchemko@smgtec.com> wrote:

> Umm... correct me if I am wrong here, but radius is pretty useless
> unless there is an internet service responding and using those
> requests. Netfilter is not that high level protocol.
> 
> PPP on the other hand has a handshake, and DOES support radius in
> later releases. 
> 
> Could you elaborate on 'implements'? Maybe I am totally wrong in what
> you are asking (probably...).
> 
> -----Original Message-----
> From: Esteban [mailto:esteban@alstec.fr] 
> Sent: Tuesday, June 17, 2003 9:10 AM
> To: netfilter@lists.netfilter.org
> Subject: radius
> 
> Hello,
> 
> is there a patch for netfilter which implements radius authentication
> ?
> 
> Thx.
> 
> -- 
> Stephane DESMET
> Alstec Informatique
> 17, rue du Colisee
> 75008 Paris
> 
> 


