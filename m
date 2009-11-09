From: paddy joesoap <paddyjoesoap@gmail.com>
Subject: Re: Forward Chain: is Inbound traffic on eth0 not also Outbound 
	depending on your view?
Date: Mon, 9 Nov 2009 10:17:53 +0000
Message-ID: <ac5c74140911090217r67f9781aob6807bf682743839@mail.gmail.com>
References: <ac5c74140911080311g21df128fte32b05d90b233a33@mail.gmail.com>
	 <33be4bb30911080621w42e006a3n2f228f77699a277e@mail.gmail.com>
	 <ac5c74140911080644t3f028a38jcf06d2992a59242c@mail.gmail.com>
	 <4AF7E840.3060801@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=ylqasxvZd2794RtUFzpDC4gnY9BQF6jgs6EyVY60mX0=;
        b=Gt1bQNYJ16O9/H/v037Xg5FQgJRVvPG/ur45KFmYKVdiM7drcOzPVbCwStEpaGKFkd
         ycTDGsetfLf0Mi+6Vn89X60bdmvTMsZaJEbVOvobaTbyfebNmP+Y+o/DgZ2ZSplh8oio
         7Tim9YOe2qSikJORSOwyfriBweYYP/cNYCyVU=
In-Reply-To: <4AF7E840.3060801@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Mon, Nov 9, 2009 at 10:00 AM, Mart Frauenlob
<mart.frauenlob@chello.at> wrote:
> paddy joesoap wrote:
>>
>> Hi guy's
>>
>> I was just reading through the links Mart provided to try and get a
>> handle on things.
>>
>> Suppose this is the scenario:
>>
>> Internet -- Firewall -- Web server where the firewall has eth0 =3D
>> External and eth1 =3D Internal
>>
>> My understanding of seeing examples on the web (please correct me if=
 I
>> am wrong) is that access to a web server can be permitted as follows=
:
>>
>> Scenario 1:
>> iptables -A FORWARD -i eth0 -s anyIP --sport anyPort -d webServIP
>> --dport 80 =A0-j ACCEPT
>> iptables -A FORWARD -o eth1 -s webServIP --sport 80 -d anyIP --dport
>> anyPort =A0-j ACCEPT
>>
>> I was just wondering must I also include 2 other rules:
>>
>> Scenario 2:
>> iptables -A FORWARD -i eth0 -s anyIP --sport anyPort -d webServIP
>> --dport 80 =A0-j ACCEPT // external in on eth0
>> iptables -A FORWARD -o eth1 -s anyIP --sport anyPort -d webServIP
>> --dport 80 =A0-j ACCEPT // new rule. external out on eth1 toward web
>> server
>> iptables -A FORWARD -o eth1 -s webServIP --sport 80 -d anyIP --dport
>> anyPort =A0-j ACCEPT
>> iptables -A FORWARD -i eth0 -s webServIP --sport 80 -d anyIP --dport
>> anyPort =A0-j ACCEPT // new rule
>>
>> >From what I can gather of the iptables tutorial, I don't have to wo=
rry
>> about the 2 new rules. Perhaps they are redundant, in the sense that
>> traffic is being filtered in one direction of each interface and
>> filtering the same kind of traffic in both directions on each
>> interface maybe considered duplication.
>>
>> But then again what about the default policy of Drop. Would not havi=
ng
>> these two new rules mean http traffic fails? My guess is after traff=
ic
>> has been processed (from the netfilter flow diagram Maart sent)
>> in one direction it is the automatically routed to the second
>> interface without filtering. So the answer is yes, http traffic will
>> still get by. Correct?
>>
>> This now makes me as the question why bother with filtering eth1 at
>> all in Scenario 1? Could the rules equally have been written as:
>>
>> Scenario 3: (note single interface used, filter in both directions o=
n
>> eth0)
>> iptables -A FORWARD -i eth0 -s anyIP --sport anyPort -d webServIP
>> --dport 80 =A0-j ACCEPT
>> iptables -A FORWARD -o eth0 -s webServIP --sport 80 -d anyIP --dport
>> anyPort =A0-j ACCEPT
>>
>> Again apologies for the obvious stupidity on my part.
>>
>
> As soon a packet matches a rule and the target is terminating, like t=
he
> ACCEPT target is, there is no more filtering on the packet - it is AC=
CEPTED.

The above line has switched on the light-bulb.


> Hence your rules would be redundant.
> As i already told you, you can use -i eth0 and -o eth1 for FORWARD ru=
les, if
> you desire/and or need that.
>

Thanks for the insights Mart.
