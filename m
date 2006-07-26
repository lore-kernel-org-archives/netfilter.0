From: Anssi Hannula <anssi.hannula@gmail.com>
Subject: Re: Messages in log with SNAT target
Date: Wed, 26 Jul 2006 11:16:19 +0300
Message-ID: <44C724D3.2090602@gmail.com>
References: <44C4903B.3080004@gmail.com> <44C49FC6.6030504@plouf.fr.eu.org>
	<44C4A904.4010403@gmail.com>
	<02BB8A4AC86C564C89C7F14CF98CE0C40127D9@knowledge.wizdom.nu>
	<44C4B69E.9040302@gmail.com>
	<Pine.LNX.4.64.0607252038520.10006@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64.0607252038520.10006@darkstar.sysinfo.com>
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
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: netfilter@lists.netfilter.org

R. DuFresne wrote:
> On Mon, 24 Jul 2006, Anssi Hannula wrote:
> 
>>> Sietse van Zanen wrote:
>>>
>>>> The security risk is, and it is a MAJOR one, especially with WiFi
>>>> networks is that any PC on the network could just be set up with a
>>>> private IP on your private network, start sniffing for passwords etc.
>>>>
>>>> It's a very, very bad idea to put your public and private WiFi
>>>> infratructure on the same physical network.
>>>> I would say, there's even no point in firewalling this. Firewalling
>>>> is seperating, you are combining.
>>>>
>>>> -Sietse
>>>
>>>
>>> In this case the private network is only a very small home network. I
>>> don't see there being too big a risk of anyone setting up a box with
>>> private IP on the network with harm on their mind. If that would be
>>> possible, wouldn't the security of the whole system be compromised so
>>> much that the private/public separation doesn't matter anymore?
>>>
>>> The main purpose of the private IPs here is the ease of use and having
>>> no public IP for a system if so wanted.
> 
> 
> 
> Hopefully, for yer sake, you are the only home for mile and miles
> around....Yet, I doubt such is the case, so you are a risk to all sadly.
> 

So, what do you suggest, then?

That I have 2 separate wireless networks, one for the internet and one
for the private network?

(the WLAN is of course WPA encrypted)

-- 
Anssi Hannula


