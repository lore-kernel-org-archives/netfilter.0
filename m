From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: redirect input SYN before forward to QUEUE
Date: Tue, 11 Jun 2002 08:17:07 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020611121707.GA24959@cannon.eng.us.uu.net>
References: <20020610181923.2a0030a3.francois@chenais.net> <20020610184536.354c2fac.francois@chenais.net> <20020611112033.6db3a9b8.francois@chenais.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020611112033.6db3a9b8.francois@chenais.net>
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
To: Francois Chenais <francois@chenais.net>
Cc: netfilter@lists.samba.org

On Tue, Jun 11, 2002 at 11:20:33AM +0200, Francois Chenais wrote:

> This works fine with another ethernet card !
> 
> will netfilter support eth0:0 interfaces in the future ?

The future is already there ;-) Use iproute2 (ip/tc). With "ip" you can
avoid the :0 notation with the same functionality and more...

Besides I thought there was a very small patch which made netfilter to
not choke on ':' or '.' in the interface name. But not sure where to get
the patch... But anyway, use "ip".

Ramin

> 
> 	Fran?ois

