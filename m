From: =?windows-1252?Q?Rob_Sterenborg?= <rob@sterenborg.org>
Subject: RE: Verify rules
Date: Fri, 27 Mar 2009 20:25:56 +0100
Message-ID: <vmime.49cd2844.bf9.646cfca12f3d6c6@kshira.sterenborg.org>
References: <15a901c9aeff$9bc91570$d35b4050$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49CD1FBC.4020604@mailinator.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> you may also want to rate limit the number of attempts from the
> same IP to connect to SSH or you WILL get hammered.  If you
> search the archives I think *Joanne Dow* posted an example of
> how to do so.

If you don't need everyone to be able to reach the ssh port, you can lock the source IP's that must be able to reach the SSH port down to only the ones that should be able.
Also/or, you could create 2 sshd_config's (with of course 2 separate sshd's on the inet and lan/dmz interfaces) and configure the inet sshd to only accept a pubkey instead of password authentication. It isn't too hard to do and you're rid of password guessing attacks.


Grts,
Rob


