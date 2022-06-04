From: =?UTF-8?Q?Stefan_Riha?= <stefan@sriha.net>
Subject: RE: Possibly dangerous interpretation of address/prefix pair in -s
 option
Date: Sat, 4 Jun 2022 06:45:29 +0000
Message-ID: <010201812d7632b0-1fa6a570-192e-423c-ba87-558c0d650ac9-000000@eu-west-1.amazonses.com>
References: <mail.629a20b0.7e37.7f80bf761b5d8a04@storage.wm.amazon.com> 
 <010201812a366a81-2f2bc7f3-e142-4807-9742-bfa7b19dd468-000000@eu-west-1.amazonses.com> 
 <e2ba2738-2eff-3e97-a389-77abd17664dd@thelounge.net> 
 <mail.629a2dfb.57ab.496a0a414c9495b2@storage.wm.amazon.com> 
 <010201812a43a0d9-c4953858-f0e1-48db-a7a3-420d53a11cd7-000000@eu-west-1.amazonses.com> 
 <df64386a-5daf-6f97-3d37-b0c9b7c25537@thelounge.net> 
 <mail.629a3289.7fbb.1b2912350cfc7c1b@storage.wm.amazon.com> 
 <010201812a556c50-7856ee86-1a5a-4135-8acf-869a930d54c8-000000@eu-west-1.amazonses.com> 
 <768e4d99-0c50-01af-4434-20378c06a3cf@thelounge.net> 
 <mail.629a35d7.2a64.4a0b184f3a85fa1c@storage.wm.amazon.com> 
 <010201812a625427-9b51500d-3126-4b6f-95d0-d71702c349a7-000000@eu-west-1.amazonses.com> 
 <b6945516-3120-24f0-9990-294f1653c9a4@thelounge.net> 
 <mail.629a388a.7bba.0e9843742ea45568@storage.wm.amazon.com> 
 <010201812a6ce183-1a849304-791a-4874-9668-23f871060bac-000000@eu-west-1.amazonses.com> 
 <mail.629a3f4f.4e0b.2e3e82745c98ed1d@storage.wm.amazon.com> 
 <06924b12-8664-1e96-2a0b-d3711bbb67d7@thelounge.net> 
 <010201812a875150-65c17845-7e32-4eac-8c72-28bf90279b54-000000@eu-west-1.amazonses.com> 
 <CANGix0CNMH0yhVSxaVqX5DnuZs0oNc6fKMDX=BAm=+PzhFVKSg@mail.gmail.com> 
 <CANGix0Ddy_BW5wgUbmEmMiJajs_FxEFRcYDPuzNL3aaBxnCtoQ@mail.gmail.com> 
 <mail.629a519e.0cd7.3039eb4576cddb5d@storage.wm.amazon.com> 
 <010201812aced64c-cfcce59b-f83c-4892-b6eb-43b9b0a2fc64-000000@eu-west-1.amazonses.com> 
 <2ae6f4de-e03c-1fab-c1fa-68915b3837d8@netfilter.org> 
 <mail.629aff89.73ff.3ae87c7606a48613@storage.wm.amazon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=3yk3epreue6hqzjk7k5x3u3k6qklparn; d=sriha.net; t=1654325130;
        h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
        bh=eUs02EORNEQ6wKQXniagcpAP2LuVJRWkqiVJxZ6hHOk=;
        b=Lq7nvUFyKf2gzBGBHQW3ne9PMhK2WJjtPL7jIPEvdMqYGgx2r6wbBmLPrhd4+nWT
        VUy4YgFoGZigLdoFJvXhfC0hU/0Dv9FjEn17WWh9VPsFpyuP1IEZWFFQW4RVm0PlVMm
        /bRKK99gKF1HzxRXs1+JSy42zJp1FWJOSxWaLaK0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn; d=amazonses.com; t=1654325130;
        h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
        bh=eUs02EORNEQ6wKQXniagcpAP2LuVJRWkqiVJxZ6hHOk=;
        b=dZfBvhoY0thb3+0uQUs26WciQ2ikuWygvObxVm9u98w1dqbqEsPktG+mcKifcNE7
        EpAvo9yhhZBp6LWfmDLnw6PX0J1wHSRUjoWRryiJAx+T7dDVhIu6JbwjYMaQlCLTKBI
        dgE1v6uVcyBTzrxq+qUmrnTUTHrLwcfVMFnwVxnY=
In-Reply-To: <2ae6f4de-e03c-1fab-c1fa-68915b3837d8@netfilter.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?UTF-8?Q?Jozsef_Kadlecsik?= <kadlec@netfilter.org>
Cc: =?UTF-8?Q?Alex_Buie?= <alex.buie@datto.com>, =?UTF-8?Q?netfilter=40vge?= =?UTF-8?Q?r=2Ekernel=2Eorg?= <netfilter@vger.kernel.org>, =?UTF-8?Q?h=2Ereindl=40thelounge=2Enet?= <h.reindl@thelounge.net>

>> Read the manpage: "Address can=20=0D=0Abe either a network name, a net=
work IP address (with /mask), or a plain IP=20=0D=0Aaddress".=0D=0A=0D=0A=
The manpage states that the input can be either of three:=0D=0A=0D=0A1) a=
 network name=0D=0A2) network IP address (with /mask)  (i.e. 10.0.0.0/24 =
in the example)=0D=0A3) a plain IP address (i.e. 10.0.0.2 or equivalently=
 10.0.0.2/32 in the example)=0D=0A=0D=0Aand the input 10.0.0.2/24 is neit=
her of those three (it's a contextually inappropriate combination of 2 an=
d 3). It therefore should be rejected, but instead it is reinterpreted to=
 be of type 2), i.e. a network IP address (with /mask). What do you think=
=3F=0D=0A=0D=0AMy point is, I think this re-interpretation dangerous. I t=
hink the appropriate behaviour would be to error on incorrect/ambiguous i=
nput.=0D=0A=0D=0A>> The input is interpreted accordingly, therefore 10.0.=
0.2/24 is=20=0D=0Aequal to 10.0.0.0/24.=0D=0A=0D=0ABut would you agree th=
at if the input isn't of the 3 three types explicitly allowed in the manp=
age, it should be rejected=3F The word "either" in the manpage gives the =
impression that the three options are mutually exclusive, and not a conte=
xtually inappropriate mixture.=0D=0A=0D=0A=0D=0A
