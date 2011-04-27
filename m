From: Mike Hendrie <mike@hendrienet.com>
Subject: Re: Proxy Filter iptable Settings
Date: Wed, 27 Apr 2011 11:46:41 -0500
Message-ID: <BANLkTin_yWWZ_Tmo=T_dsc9xujLtf6h1xA@mail.gmail.com>
References: <BANLkTin=W-MWbPfrpqnmWDCMq9fGp5CvwQ@mail.gmail.com>
	<1303885014.18916.10.camel@andybev-desktop>
	<BANLkTikUnSoefT3Xy=O+43zWGEw3tgb7wQ@mail.gmail.com>
	<4DB80945.8040304@atc.tcs.com>
	<BANLkTiky5xV9yhr-1nq7cLOSmV1nGt=cKg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTiky5xV9yhr-1nq7cLOSmV1nGt=cKg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vigneswaran R <vignesh@atc.tcs.com>
Cc: netfilter@vger.kernel.org

Is there a trick to getting a secureNAT connection to work through the
proxy server with the following iptables setting? Do I have to make
another rule like the one below for each port that is required?

iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j REDIRECT
--to-port 8080

Thank you

On Wed, Apr 27, 2011 at 7:45 AM, Mike Hendrie <mike@hendrienet.com> wro=
te:
> I tried:
> sudo =A0iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j
> REDIRECT --to- 8080
> iptables -t nat -A POSTROUTING -s 172.20.0.0/16 -j MASQUERADE
>
> And still ended up with the same message:
>
> ERROR
> The requested URL could not be retrieved
>
> ---------------------------------------------------------------------=
-----------
>
> The following error was encountered while trying to retrieve the URL:
> http://twinlakes.k12.wi.us/
>
> Connection to 216.56.4.133 failed.
>
> The system returned: (110) Connection timed out
>
> The remote host or network may be down. Please try the request again.
>
> Your cache administrator is webmaster.
>
>
>
>
> ---------------------------------------------------------------------=
-----------
>
> Generated Wed, 27 Apr 2011 12:46:38 GMT by localhost (squid/2.7.STABL=
E9)
>
>
>
>
> On Wed, Apr 27, 2011 at 7:17 AM, Vigneswaran R <vignesh@atc.tcs.com> =
wrote:
>> On 04/27/2011 04:56 PM, Mike Hendrie wrote:
>>>
>>> Thanks for the response. Once I implemented your suggestion, I get =
the
>>> following error when trying to access the school's website from WIT=
HIN
>>> the LAN. Why can it not find the URL?
>>>
>>> ERROR
>>>
>>> The requested URL could not be retrieved
>>>
>>> The following error was encountered while trying to retrieve the UR=
L:
>>> http://www.twinlakes.k12.wi.us/
>>>
>>> Connection to 216.56.4.133 failed.
>>> The system returned: (110) Connection timed out
>>
>> I assume that you want to give access to the Internet for all the ma=
chines
>> in the LAN, through your "PROXY" server. ie., making the server an I=
nternet
>> Gateway.
>>
>> If so, the following should work,
>>
>> iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j MASQUERADE
>>
>> Here, replace the 192.168.1.0/24 with the correct IP address range u=
sed in
>> your LAN. Please ensure that all the machines have the default route
>> pointing to the server.
>>
>> This allows, all kinds of traffic like http, ftp, ssh etc., to the p=
ublic
>> sites. If necessary, add further iptables rules to restrict this. Ho=
pe this
>> helps.
>>
>>
>> Regards,
>> Vignesh
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>
