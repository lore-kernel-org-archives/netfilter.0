From: Daniel Bidwell <bidwell@andrews.edu>
Subject: Re: Checkpoint fw-1 Iptables translation
Date: 09 Jun 2003 11:17:49 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1055171871.731.2.camel@samwise>
References: <E9C5F057A783F94E9868010ACFDB3AA42D8CE2@srvpadovaad.cerved.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E9C5F057A783F94E9868010ACFDB3AA42D8CE2@srvpadovaad.cerved.com>
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
To: "Masiero Giorgio, PD" <gmasiero@cerved.com>
Cc: netfilter@lists.netfilter.org

On Mon, 2003-06-09 at 08:44, Masiero Giorgio, PD wrote:
> Hy, my name is Giorgio and I have this problem.
>  
> We have Checkpoint FW-1 firewalls, and we are trying to build a program
> that translate all the Checkpoint FW-1 configuration files (Objects, Rules,
> NATs)
> into an understandable set of files for Iptables.
> We wanto to do this because we are tryng to build a "disaster recovery" site
> on which we want to use a linux machine with Iptables as firewall.
>  
> I'm trying to write this program, but It isn't easy.
> Is there anybody that could help me doing this job?
> Maybe someone has already had my problem and has already writed the program
> I'm looking for.
>  
There is a contributed program with the fwbuilder package that converts
checkpoint-1 configurations into fwbuilder configurations.  fwbuilder
has a graphical interface that is very similar to that of checkpoint
also.

You can convert checkpoint firewall configurations into fwbuilder
configurations in about 30 seconds.  fwbuilder can be found at
fwbuilder.sourceforge.net

> Thanks for your help 	Giorgio
-- 
Daniel R. Bidwell	|	bidwell@andrews.edu
Andrews University	|	Information Technology Services
If two always agree, one of them is unnecessary
"Friends don't let friends do DOS"
"In theory, theory and practice are the same.
In practice, however, they are not."


