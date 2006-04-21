From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: packets loging
Date: Fri, 21 Apr 2006 09:57:38 +0200 (CEST)
Message-ID: <51316.193.173.147.3.1145606258.squirrel@webmail.sterenborg.info>
References: <002d01c66445$01dd28f0$0e01050a@CyberAdmin><4447F34C.6030500@yahoo.com.mx><000d01c6650d$99afe6e0$0e01050a@CyberAdmin>
	<60102.193.173.147.3.1145604135.squirrel@webmail.sterenborg.info>
	<002801c66516$40ff0ae0$0e01050a@CyberAdmin>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002801c66516$40ff0ae0$0e01050a@CyberAdmin>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Fri, April 21, 2006 09:36, robee wrote:
>>> but i want only this:
>>>     Apr 21 04:09:20 master kernel: HTTP_IN=3Deth2 OUT=3Deth0 SRC=3D10=
.11.9.2
>>> DST=3D213.54.82.29
>>> any sugestion?
>> AFAIK that isn't possible.
>> Why would you want to anyway ?
>> Gr,
>> Rob
>
>
> less data to write, less disk load

It must be a really busy box if this is going to hog your disk space|IO.
If you use the limit match ("-m limit --limit 1/sec" or something) your
logging will also be less.


Gr,
Rob



