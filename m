From: Lukas Ruf <ruf@rawip.org>
Subject: Re: Blocking forwarding of packets in WLAN
Date: Thu, 14 Oct 2004 15:58:08 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041014135808.GB824@tik.ee.ethz.ch>
References: <000501c4b1f4$89506360$db0a11ac@eurecom.fr>
Reply-To: PLEASE REPLY TO THE LIST <dev_null@rawip.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000501c4b1f4$89506360$db0a11ac@eurecom.fr>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> Claudio Lavecchia <Claudio.Lavecchia@eurecom.fr> [2004-10-14 15:51]:
>
>
> void block_forwarding(char * MAC_address);
>
> Is this feasible someway using iptables? Can anyone give me a
> precise hint on how to do that? I would be truly grateful if someone
> could help me.
>

what you could do:

    char *tmp_string = (char *)calloc(length, sizeof(char));
    strcpy(tmp_string, <your iptables command>);
    strcat(tmp_string, MAC_address);
    system(tmp_string);
    free(tmp_string);

of course million other ways exist to achieve this goal -- that's an
easy solution....

wbr,
Lukas
-- 
Lukas Ruf           | Wanna know anything about raw |
<http://www.lpr.ch> | IP? -> <http://www.rawip.org> |
eMail Style Guide: <http://www.rawip.org/style.html>|

